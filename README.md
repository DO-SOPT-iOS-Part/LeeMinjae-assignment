# LeeMinjae-assignment
<img src="https://img.shields.io/badge/Swift-F05138?style=flat-square&logo=Swift&logoColor=white"/> <img src="https://img.shields.io/badge/Xcode-147EFB?style=flat-square&logo=Xcode&logoColor=white"/>
- 33기 GO SOPT iOS 파트 과제 제출용 레포입니다.
- 과제는 `시계 기본앱 클론 코딩`과 `이론 내용 정리`, `코드 리뷰`로 구성되어 있습니다. 하나도 빠짐없이 다해봅시다💪🏻

<br>

## 🍎 iOS Part Curriculum
  
| 순번 | 커리큘럼 내용 | 기본 과제 | 심화 과제 | 이론 정리 | 금잔디 코드 리뷰 | 
| :--: | :--: | :--: | :--: | :--: | :--: | 
| Week 1 (23.10.07) | 화면 전환 및 데이터 전달, LLDB | ☑️ |  | ☑️ | ☑️ |
| Week 2 (23.10.14) | CodeBase AutoLayout  | ☑️ | ☑️ | ☑️ | ☑️ |
| Week 3 (23.10.28) | Protocol, Struct, JSON | ☑️ |  | ☑️ | ☑️ |
| Week 4 (23.11.11) | 서버 연동, 동시성 프로그래밍 | ☑️ |  | ☑️ | ☑️ |
| Week 5 (23.11.18) | 합동세미나 (클・디・서)) |
| Week 6 (23.11.25) |  애니메이션 (CA, UIView, Gesture) |
| Week 7 (23.12.02) | 아키텍쳐 패턴, DI |
| Week 8 (23.12.23) | Package관리 및 앱잼 가이드라인 |

<br>

## 🍏 클론 코딩 과제를 하면서 배운 내용을 기능별로 정리해보자!

| 순번 | 몇주차❓ | 어떤 기능인지요❓ | 링크를 알려주시와요🔥 |
| :--: | :--: | :--: | :--: |
| 1️⃣ | `2주차` | AutoLayout을 짧은 코드로 구현하려면, SnapKit | [블로그 링크🔗](https://mini-min-dev.tistory.com/79) |
| 2️⃣ | `2주차` | Code Base에서 UI 인스턴스를 직관적으로 만들기 위한 라이브러리, Then | [블로그 링크🔗](https://mini-min-dev.tistory.com/218) |
| 3️⃣ | `3주차` | UISearchController를 이용해서 TableView의 특정 Cell을 표출하는 SearchBar | [블로그 링크🔗](https://mini-min-dev.tistory.com/220) |
| 4️⃣ | `4주차` | 내가 서버 통신(Networking) 진짜 알기 쉽게 정리해서 올려줄게 (HTTP, JSON, REST API) | [블로그 링크🔗](https://mini-min-dev.tistory.com/225) |

<br>

## 🍏 이론 정리 과제를 하면서 정리한 글들을 모두 모아보자!
| 순번 | 어떤 내용을 공부했는지요❓ | 몇주차❓ | 링크를 알려주시와요🔥 |
| :--: | -- | :--: | :--: |
| 1️⃣ | Swift의 접근제어자 (Access Control) | `1주차` | [블로그 링크✌🏻](https://mini-min-dev.tistory.com/73) |
| 2️⃣ | ViewController의 생명주기 | `1주차` | [블로그 링크✌🏻](https://mini-min-dev.tistory.com/33) |
| 3️⃣ | weak self란 무엇일까? 메모리 참조 방법(strong, weak, unowned) | `1주차` | [블로그 링크✌🏻](https://mini-min-dev.tistory.com/83) |
| 4️⃣ | xib, nib란? | `1주차` | [블로그 링크✌🏻](https://mini-min-dev.tistory.com/214) |
| 5️⃣ | 클래스와 객체의 개념 정리하기 (상속, 추상화) | `1주차` | [블로그 링크✌🏻](https://mini-min-dev.tistory.com/117) |
| 6️⃣ | Final, override 키워드란 무엇일까? | `2주차` | [블로그 링크✌🏻](https://mini-min-dev.tistory.com/217) |
| 7️⃣ | 열거형(enum)에 대해 공부해주세요! | `2주차` | [노션 링크🤟🏻](https://elegant-syrup-933.notion.site/5-enum-c574ac0e23eb41a49f816e3d7daa2360?pvs=4) |
| 8️⃣ | Delegate Pattern 내용은 중요합니다. | `2주차` | [블로그 링크✌🏻](https://mini-min-dev.tistory.com/9) |
| 9️⃣ | Diffable datasource 라는 개념도 있어요!! | `3주차` | [블로그 링크✌🏻](https://mini-min-dev.tistory.com/221) |
| 1️⃣0️⃣ | compositional layout은 무엇일까요?! 왜 사용하는 걸까요?! | `3주차` | [블로그 링크✌🏻](https://mini-min-dev.tistory.com/224) |

<br>

## 🙌 Git Commit, Issue, PR Message Convention
### Commit Type
```bash
[태그] #이슈 번호 - {커밋 메시지}
```
- 예시: `[✨feat] #1 - 메인 뷰 화면전환 기능 구현`

#### 이모지와 태그별 사용 경우
| 이모지 | 태그 | 사용 경우 |
| :--: | :--: | :--: |
| ✨ | feat | 새로운 기능, 코드 추가 |
| 📦 | add | feat 이외의 부수적인 코드 추가 / 새로운 파일 생성 |
| 🔧 | chore | 그 이외의 잡일, production code의 변경은 없음 |
| 💄 | design | just 화면만 구현할 때 사용합니다 |
| 📝 | docs | README나 wiki 등 개정 |
| 🐛 | fix | 버그 잡자 버그 잡자 찍찍찍🐭 |
| ♻️ | refactor | 기존 코드 리팩토링 (성능 개선) | 
| 🔥 | remove | 쓸모없는 코드, 파일 지우기 |


<br>

### Issue title
```bash
0주차 iOS 과제 이슈
```
- 예시: `2주차 iOS 과제 이슈`

<br>

### Pull Request
```bash
0주차 iOS 과제 풀리퀘
```
- 예시: `2주차 iOS 과제 풀리퀘`
