<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<!-- ===== CHATBOT BUTTON ===== -->
<div id="chatbot-btn" onclick="toggleChat()">
AI
</div>

<!-- ===== CHATBOT BOX ===== -->
<div id="chatbot-box">

<div id="chat-header">
Assistant RH
</div>

<div id="chat-body"></div>

<input type="text" id="chat-input" placeholder="Ecrire message..."
onkeypress="if(event.key==='Enter') sendMsg()">

</div>

<style>

/* ===== BUTTON ===== */
/* BUTTON */
#chatbot-btn{
position:fixed;
bottom:20px;
right:20px;
background:#556B2F;
color:white;
width:60px;
height:60px;
border-radius:50%;
display:flex;
align-items:center;
justify-content:center;
cursor:pointer;
font-size:22px;
box-shadow:0 4px 10px rgba(0,0,0,0.2);
z-index:9999; /* مهم */
}

/* BOX */
#chatbot-box{
position:fixed;
bottom:90px;
right:20px;
width:320px;
height:420px;
background:white;
border-radius:12px;
display:none;
flex-direction:column;
box-shadow:0 10px 25px rgba(0,0,0,0.4);
overflow:hidden;
z-index:9999; /* مهم */
}

/* HEADER */
#chat-header{
background:linear-gradient(135deg,#556B2F,#8FBC8F);
color:white;
padding:12px;
text-align:center;
font-weight:bold;
}


/* BODY */
#chat-body{
flex:1;
padding:10px;
overflow-y:auto;
font-size:14px;
}

/* INPUT */
#chat-input{
border:none;
border-top:1px solid #ddd;
padding:10px;
width:100%;
outline:none;
}

/* MESSAGE STYLE */
.user{
text-align:right;
margin:5px;
color:#333;
}

.bot{
text-align:left;
margin:5px;
color:#556B2F;
font-weight:bold;
}

</style>

<script>

function toggleChat(){
let box = document.getElementById("chatbot-box");
box.style.display = (box.style.display === "flex") ? "none" : "flex";
}

function sendMsg(){

let input = document.getElementById("chat-input");
let msg = input.value.trim();

if(msg === "") return;

let body = document.getElementById("chat-body");

/* USER MESSAGE */
body.innerHTML += "<div class='user'>"+msg+"</div>";

input.value = "";

/* CALL SERVLET */
fetch("chatbot", {
method: "POST",
headers: {"Content-Type": "application/x-www-form-urlencoded"},
body: "message=" + encodeURIComponent(msg)
})
.then(res => res.text())
.then(data => {

body.innerHTML += "<div class='bot'>"+data+"</div>";
body.scrollTop = body.scrollHeight;

});

}

</script>