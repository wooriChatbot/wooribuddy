################################## 0.Import ##################################  
# GPT 프롬프트 제작 및 사용할 때 쓰는 Import
import openai
import requests
import re
import isodate
import html
import time
import os
import sys
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import random
import urllib.request
from urllib.parse import urlparse, parse_qs
from datetime import datetime
from pprint import pprint
from IPython.display import display
import json
import warnings
warnings.filterwarnings("ignore")
from flask import Flask, request, jsonify


# 모델 제작 및 사용할 때 쓰는 Import
import torch
from pathlib import Path
from transformers.data.processors.squad import SquadExample, squad_convert_examples_to_features
from transformers import AlbertForQuestionAnswering, TrainingArguments, Trainer
from transformers import AdamW, get_linear_schedule_with_warmup, AlbertTokenizer
from transformers import TFAutoModel, AutoTokenizer, AutoModel
from transformers import pipeline
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import linear_kernel
from tqdm import trange, tqdm
from typing import Any
import logging
logging.getLogger("transformers").setLevel(logging.ERROR)

################################## 1.모델 기본설정 ##################################  

# flask 코드 추가
app = Flask(__name__)

# device 설정
MODEL_PATH = "./kb-albert-char-base-v2"
MODEL_PATH_2 = "./KBALBERT_MODEL_V3/pytorch_model.bin"

device = torch.device('cpu')

model = AlbertForQuestionAnswering.from_pretrained(MODEL_PATH)
model.load_state_dict(torch.load(MODEL_PATH_2, map_location=torch.device('cpu')))
model.to(device)

# 텍스트 Tokenizer
tokenizer = AutoTokenizer.from_pretrained(MODEL_PATH)

# context DB
context = pd.read_csv('./QA_set_final_ver3.csv')
key = context['question']
value = context['context']



################################## 2.함수 정의 ##################################

# 유사도 함수 정의
def find_most_similar_context(question, question2, context):
      vectorizer = TfidfVectorizer().fit(question2)
      tfidf_matrix = vectorizer.transform(question2)
      question_vector = vectorizer.transform([question])

      # 질문의 TF-IDF 벡터와 모든 질문의 TF-IDF 벡터 사이의 코사인 유사도를 계산
      cosine_similarities = linear_kernel(question_vector, tfidf_matrix).flatten()

      # 가장 유사한 컨텍스트의 인덱스를 찾음
      best_context_index = cosine_similarities.argmax()

      return context[best_context_index]

# 현재 어떤 태스크 진행하는지 확인하기 위한 문구 생성 함수 (평범한 업무)
def task_title_normal(message, total_length, fill_char='-'):
      adjusted_length = len(message) + sum(1 for char in message if ord(char) > 127)
      space_to_fill = total_length - adjusted_length
      left_padding = space_to_fill // 2
      right_padding = space_to_fill - left_padding
      formatted_message = fill_char * left_padding + message + fill_char * right_padding
      print(formatted_message,'\n')

# 현재 어떤 태스크 진행하는지 확인하기 위한 문구 생성 함수 (중요한 업무)
def task_title_important(message, total_length, fill_char='*'):
      adjusted_length = len(message) + sum(1 for char in message if ord(char) > 127)
      space_to_fill = total_length - adjusted_length
      left_padding = space_to_fill // 2
      right_padding = space_to_fill - left_padding
      formatted_message = fill_char * left_padding + message + fill_char * right_padding
      print(formatted_message, '\n')


# 모델 함수 호출
@app.route('/model_response', methods=['POST'])
def model_response():
    # 요청 데이터에서 "question" 항목을 가져옵니다.
    data = request.get_json()
    question = data.get("question")

    qa = pipeline("question-answering", tokenizer=tokenizer, model=model, device=-1)
    best_context = find_most_similar_context(question, key, value)
    answer = qa({"question": question, "context": best_context})

    # 응답을 JSON 형식으로 반환합니다.
    return jsonify({'question': question, 'answer': answer['answer'], 'best_context' : best_context})


# gpt 호출
@app.route('/gpt_response', methods=['POST'])
def gpt_response():
      data = request.get_json()
      question = data.get("question")
      answer = data.get("answer")
      best_context = data.get("best_context")
      
      final_text = f"""
            <Work>
            - The user, a financial novice, has posed a question similar to <Question> and received an answer like <Answer>.
            - <Answer> was generated based on <Context>.
            - The user finds <Answer> insufficient as a proper response to <Question>.
            - Hence, please craft a new answer, referencing <Context> to supplement <Answer>.
            - Please divide the text into paragraphs to ensure that the sentences do not become overly lengthy.

            <Question>
            {question}

            <Answer>
            {answer}

            <Context>
            {best_context}
            """

      # GPT를 사용하기위한 API 키
      openai.api_key = "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"

      # 답변 베이스라인을 제공하는 프롬프트 (답변형태가 좋아서 사용)
      Youth_PROMPT_base = [
            {"role": "system", "content": ""},

            {"role": "user", "content": """
            <Work>
            - The user, a financial novice, has posed a question similar to <Question> and received an answer like <Answer>.
            - <Answer> was generated based on <Context>.
            - The user finds <Answer> insufficient as a proper response to <Question>.
            - Hence, please craft a new answer, referencing <Context> to supplement <Answer>.
            - Please divide the text into paragraphs to ensure that the sentences do not become overly lengthy.

            <Question>
            재테크를 전문가에게 맡길 때 필요한 점은 무엇인가요?

            <Answer>
            지속적으로 관심을 갖고 피드백을

            <Context>
            물론, 재무는 돈과 관련되기 때문에 필연적으로 숫자 계산이 수반되므로 복잡해 보이기도 하지만, 원리를 알면 누구나 쉽게 이해할 수 있다.
            둘째, 재테크는 전문가에게 맡기면 된다고 생각한다. 물론, 요즘은 일반인의 재테크를 도와주는 다양한 전문가가 많이 있고, 이들의 도움을 받는 것이 필요하다.
            그러나 결국 중요한 결정은 자신이 해야 하고 최종 책임도 자신에게 있다는 점을 명심해야 한다.
            전문가에게 맡길 때는 물론이고 맡긴 후에도 지속적으로 관심을 갖고 피드백을 해야 한다.
            셋째, 재테크는 운이 좋아야 한다고 생각한다.물론, 세상에는 운이 좋아 돈을 버는 사람이 있다.
            하지만 어쩌다가 몇 차례 운이 좋아 돈을 버는 경우는 있으나, 긴 인생을 생각하면 계속 요행으로만 재테크에 성공하는 사람은 없다.
            """},

            {"role": "assistant", "content": """재테크를 전문가에게 맡길 때 고려해야 할 주요 점들을 다시 한번 정리해보겠습니다. 먼저, 재무와 관련된 문제는 복잡한 숫자 계산이 포함되기 때문에 어렵게 느껴질 수 있습니다. 그러나 이러한 원리를 이해하면, 재테크에 대한 접근이 더욱 쉬워집니다. 그렇기에 전문가에게 맡기기 전에 기본적인 재무 원리에 대한 이해가 필요합니다. 다음으로, 요즘에는 재테크 전문가가 많이 있어서 이들의 도움을 받는 것이 좋습니다. 그러나 중요한 것은, 전문가의 도움을 받더라도 최종 결정은 본인이 내리게 되며, 그 결과에 대한 책임 역시 본인에게 있습니다. 이를 명심하고, 전문가에게 재테크를 맡긴 후에도 지속적으로 관심을 갖고 피드백을 주는 것이 중요합니다. 전문가의 조언만 의존하는 것이 아니라, 본인의 상황과 목표에 따라 적절히 판단해야 합니다. 마지막으로, 재테크에서 운도 중요한 요소로 작용할 수 있습니다. 일시적인 행운으로 돈을 벌 수는 있지만, 장기적인 관점에서는 전략과 계획이 더 중요합니다. 따라서 재테크를 할 때는 단순히 행운을 기대하기보다는 체계적이고 지속적인 계획을 세우는 것이 중요하다는 점을 명심해야 합니다. 요약하면, 재테크를 전문가에게 맡길 때는 기본 원리의 이해, 전문가의 조언과 본인의 판단의 균형, 그리고 장기적인 계획과 전략의 중요성을 기억해야 합니다.
            """}
            ]

      Youth_PROMPT_base.append({"role": "user", "content": final_text})


      response = openai.ChatCompletion.create(
      model="gpt-4",
      messages = Youth_PROMPT_base,
      temperature=0
      )
      response_text = response.choices[0].message.content

      task_title_normal('프롬프트 결과 생성 완료',80)

      # 토큰 관리를 위해 최근 응답 삭제
      Youth_PROMPT_base.pop()

      return jsonify({'response_text': response_text})


if __name__ == "__main__":
    app.run()