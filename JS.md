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
const  
console.log  
let  






메모 
----

null : 빈 값이며 null자체로 값   
defer : html 구조를 전부 실행 후 나중에 자바스크립트를 실행(헤더 안에 넣을 때 신경쓸 것)
let : 선언 이름은 부여했으나 공간은 배정되지 않은 상태(초기 값이 들어가있지 않은 상태)  
자료형 : 자료를 저장하는 형태를 제약하는 것  
Object.prototype : 자바스크립트의 모든 객체가 상속하는 프로토타입 체인의 최상위 객체
toString() : 객체의 정보를 문자열로 변환하여 반환  
hasownProperty() : 객체가 특정 속성을 직접 소유하고 있는지 여부를 체크(True/False)  
valueOf() : 객체의 원시값 표현을 반환
toLocaleString() : 객체를 지역화된 문자열로 변환하여 반환  
propertyIsEnumerable() : 특정 속성이 열거가능한 속성인지 여부를 확인  
Construcetor : 객체를 생성한 생성자 함수를 참조  
생성자 함수 : 객체에 필요한 공간과 객체에 대한 속성을 만드는 함수

----------------------------------------------------------
### 배열관련 메서드
PUSH : 배열 끝에 요소 추가  
POP : 배열에서 마지막 요소를 제거하고 그 요소를 반환  
reduce :  
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






