window.addEventListener('load', function(){

  const pullDownButton = document.getElementById("header-lists");

  pullDownButton.addEventListener('mouseover', function(){
    console.log(123)
    this.setAttribute("style", "color:#616161;");
  })

  pullDownButton.addEventListener('mouseout', function(){
    this.removeAttribute("style", "color:#FFBEDA;");
  })
})
