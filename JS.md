JS
-----
![JS](https://github.com/sdee96/test/assets/155033213/afa9a4bf-1e3b-4307-a19a-2357b7b4ff90)


JS(JavaScript)는 객체(Object)기반의 스크립트 언어이다  
JS는 동적이며 타입을 명시할 필요가 없는 인터프리터 언어이다  
JS는 객체 지향형 프로그래밍과 함수형 프로그래밍을 모두 표현할 수 있다  
JS는 주로 웹 브라우저에서 사용되나, Node.js와 같은 프레임워크를 사용하면 서버 측 프로그래밍에서도 사용할 수 있다  
현재 컴퓨터나 스마트폰 등에 포함된 대부분의 웹 브라우저에는 자바스크립트 인터프리터가 내장되어있다  




HTML로는 웹의 구조를 변경하고 CSS로는 웹의 스타일을 지정 JS로는 웹의 동작을 구현할 수 있다  
[참고자료-브라우저 내장 객체](https://kssong.tistory.com/29)


------
### 주요 명령어   
document.write  
console.log  
**let**  : 중복선언 불가능, 재할당 가능
**const** : 중복선언 불가능, 재할당 불가능






메모 
----

**null** : 빈 값이며 null자체로 값   
**defer** : html 구조를 전부 실행 후 나중에 자바스크립트를 실행(헤더 안에 넣을 때 신경쓸 것)  
**let** : 선언 이름은 부여했으나 공간은 배정되지 않은 상태(초기 값이 들어가있지 않은 상태)    
**자료형** : 자료를 저장하는 형태를 제약하는 것    
**Object.prototyp**e : 자바스크립트의 모든 객체가 상속하는 프로토타입 체인의 최상위 객체  
**toString()** : 객체의 정보를 문자열로 변환하여 반환    
**hasownProperty(**) : 객체가 특정 속성을 직접 소유하고 있는지 여부를 체크(True/False)    
**valueOf()** : 객체의 원시값 표현을 반환  
**toLocaleString()** : 객체를 지역화된 문자열로 변환하여 반환    
**propertyIsEnumerable()** : 특정 속성이 열거가능한 속성인지 여부를 확인    
**Construceto**r : 객체를 생성한 생성자 함수를 참조    
**생성자 함수** : 객체에 필요한 공간과 객체에 대한 속성을 만드는 함수  



----------------------------------------------------------
### 배열관련 메서드
---
PUSH : 배열 끝에 요소 추가  
POP : 배열에서 마지막 요소를 제거하고 그 요소를 반환  
reduce : 배열의 요소를 하나로 줄이는 함수, 배열의 각 요소를 순회하면서 누적된 값을 계산하고 최종 결과를 반환 할 수 있음  
reduce((누산변수,item)=>{logic},누산변수초기값)   
forEach  : 배열 요소에 대해 제공된 함수를 한 번씩 실행  
forEach((item)=>{logic})배열을 배출하지 않음  
sort : 기본 함수는 요소를 문자열로 변환 이후 사전편찬순서대로 오름차순으로 정렬    
map() : 함수의 반환 값으로 새로운 배열을 생성  
filter : 조건식을 만족하는 요소만 필터링해서 따로 배열  
filter((item)=>{condition})  
**map vs filter :  
map : 여러 산술된 인자를 받아 배열을 만든다(조건식도포함)  
map((map)=>{logic})
filter : 조건식의 false/true 배열  




---
### JS 흐름제어
---
**IF** : if elseif else => 기본적인 문법이며 else에는 if와 elseif를 제외한 모든 경우이므로 조건식을 작성하지 않아도 된다  
  
**switch** : 키보드 이벤트에 반응하는 코드를 작성할 때 사용  
ex) switch() {  
  case ''    
    break;    
    
      
}  
**while**
기본문법  
ex)  
let i=0; // (탈출용 변수)  
while(i<10) // 반복하기 위한 조건  
{  
document.write("Hello  World")  
i++ // 반복문을 탈출하기 위한 연산 작업 }  
  
**for**
For(변수값;조건식;연산식) => 기본 문법
ex)For(let i=0;i<10;i++)


  


---
### JS 함수
---
[함수](https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Functions)

[**Hoisting**](https://developer.mozilla.org/ko/docs/Glossary/Hoisting)

인터프리터가 코드를 실행하기 전에 함수,변수,클래스 또는 임포트(import)의 선언문을 해당 범위의 맨 위로 끌어올리는 것처럼 보이는 현상을 뜻함  


함수 이름이 중첩되더라도 허용되기에 에러를 확인하기 힘들다.  
const name=()=>{} 형태로 함수를 생성시 hoisting이 적용되지 않아 권장된다

[**CLOSURE(클로저)**}(https://developer.mozilla.org/ko/docs/Web/JavaScript/Closures#%EC%96%B4%ED%9C%98%EC%A0%81_%EB%B2%94%EC%9C%84_%EC%A7%80%EC%A0%95lexical_scoping) 

기본속성

내부 함수가 외부 함수의 변수에 접근할 수 있는 것을 의미  
정보은닉 : 클로저를 사용하여 외부에서 접근할 수 없도록 변수를 보호하고,내부 함수를 통해서만 접근할 수 있다  
데이터 보존 : 함수가 생성될 당시의 환경을 유지하면서,데이터를 영구적으로 보존할 수 있다.
비동기 처리 : 비동기적인 작업에서 결과를 유지하고 ,필요할 때 접근할 수 있다



[**CallBack**]
함수를 호출하는 시점이 바뀌어진 형태의 함수  
기존에는 사용자(개발자)가 함수를 직접 정의 -> 정의된 함수를 호출(Call)하여 결과를 반환 받는 방식  
하지만 CallBack 함수의 인자로 수행로직(()=>{},fucntion(){})을 전달하여 콜백함수로부터 처리된 결과를 반환받는 형태




