
<input type="radio" name="response" value="yes" id="yes">
<label for="yes">No</label>
<form action="/chatbot/gpt" method="post" id="responseForm">
	<input type="hidden" name="question" value='${QAresponse }' />
	<input type="radio" name="response" value="no" id="no">
	<label for="no">Yes</label>
	<input type="submit" value="Submit" id="submitButton">

</form>
