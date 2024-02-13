console.log("05.js start...");
const boxEl = document.querySelector('.box');
        boxEl.addEventListener('click',function(){
            console.log("Clicked...");
            boxEl.style.backgroundColor='orange';    /* css에서는 -color: 적용이되나 javascript에서는 대쉬 생략시 대쉬 뒤의 문자를 대문자로 사용*/                                                                        
        });



        