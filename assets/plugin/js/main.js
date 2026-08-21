// window_scroll_function

window.onscroll = function () {
    var navbar = document.querySelector('.navbar');
    var bottomtotop_btn = document.querySelector('.bottomtotop_btn');
    var windowpageup = window.pageYOffset;
      if(windowpageup > 100){
        navbar.classList.add("navbar_animation");
        bottomtotop_btn.classList.add("scroll_btn");
      } else if(windowpageup < 100){
        navbar.classList.remove("navbar_animation");
        bottomtotop_btn.classList.remove("scroll_btn");
      }
      bottomtotop_btn.onclick = function(){
            window.scrollTo({
              top : 0,
              behavior : "smooth",
            })
          }
      bottomtotop_btn.onclick = function() {
            const targetPosition = 0;
            const startPosition = window.pageYOffset;
            const distance = targetPosition - startPosition;
            const duration = 900;
            let start = null;
                window.requestAnimationFrame(step);
                function step(timestamp) {
                        if (!start) start = timestamp;
                        const progress = timestamp - start;
                        window.scrollTo(0, easeInOutCubic(progress, startPosition, distance, duration));
                        if (progress < duration) window.requestAnimationFrame(step);
                     }
                function easeInOutCubic(t, b, c, d) {
                            t /= d/2;
                            if (t < 1) return c/2*t*t*t + b;
                            t -= 2;
                            return c/2*(t*t*t + 2) + b;
                    };
      
           }
  
  };
  
  // window_scroll_function
  
  // dropdown_menu
  
    var dropdown = document.querySelector('.dropdown');
    var dropdownmenu = document.querySelector('.dropdownmenu');
    var dropdown_toggle = document.querySelector('.dropdown-toggle');
  
    // dropdown.onclick=function(){
    //   dropdown.classList.toggle('dropdown_toggle')
    //   dropdownmenu.classList.toggle('toggle')
    // }
   
    document.addEventListener('click', function (e) {
      var toggleremove = dropdown.contains(e.target);
      if (!toggleremove) {
          dropdownmenu.classList.remove('toggle')
        
      }
    });
  
  // dropdown_menu
  
  // preloader
  window.onload = function(){
    var preloader = document.querySelector('.preloader');
      setInterval(function(){
      preloader.style.display = "none"      
            },1000)
  }
  // preloader
  
  // accordion
  var accordion = document.querySelectorAll('.accordion-item');
  accordion.forEach(accord => {
    accord.addEventListener('click',() => {
      accord.classList.toggle('red')
    })
    document.addEventListener('click', function (e) {
      var ignor =  accord.contains(e.target);
      if (!ignor) {
        accord.classList.remove("red");
      }
    });
  
  })
  // accordion
  
  // humbergarbtn
    let navtog = document.querySelector('.navbar-toggler')
    navtog.onclick=function(){
      this.classList.toggle('navtogclass')
  
    }
  // humbergarbtn
  
   
  // password hide and show
  
  if(document.getElementById("password")){
    const password = document.getElementById('password');
    const show = document.getElementById('show');
    const hide = document.getElementById('hide');
        hide.onclick=function(){
          if(password.type == 'password'){
            password.setAttribute('type','text');
          this.classList.add('hide');
  
          }
        }
        show.onclick=function(){
        if(password.type=="text"){
            password.setAttribute('type','password');
            hide.classList.remove('hide');
          }
        }
  }
  // password hide and show