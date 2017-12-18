function port(msg) {
  console.log(msg);
  if (msg.tag == "ResetCliplet") {
    document.querySelector("video#"+msg.data).currentTime = 0;
    console.log(document.getElementById(msg.data));
  }
}
