# Rels
2022년 CGM 대회 '대면시대' 출품작

## 🖥️ 프로젝트 소개
시간제 턴 조작 방식으로 적을 공격하며 임무를 수행하는 2인용 게임입니다.

![image](https://github.com/user-attachments/assets/c02fbcda-69bf-421a-b49e-1a9eb1ce4c6c)
![image](https://github.com/user-attachments/assets/b934f2b7-7d55-44b7-b6f8-cad11f431538)

## ⏰ 개발 기간
* 22.06.16. ~ 22.8.31.

## ⚙️ 개발 환경
* GMS2 (현재 GameMaker)

## 🦾 주요 기능
### 분할된 화면으로 두 플레이어가 각 캐릭터를 조종
![image](https://github.com/user-attachments/assets/8fbd3f5e-24b6-4c4c-8d34-9c0e235c6393)
- 카메라 내장 시스템을 이용하여 게임 뷰를 분할하고 비추는 범위는 카메라를 각각 설정하여 만들었다. 카메라는 커서(목표 위치)와 플레이어의 사이를 비추게 된다.
- 플레이어의 이동은 맵을 먼저 타일 크기에 맞는 그리드로 나누고 경로를 표시해야 할 타일이 플레이어의 이동 거리 내일 경우 초록색 화살표로 표시한다. 그렇지 않으면 빨간색 점선으로 표시하여 최대 이동 거리까지만 이동할 것임을 나타낸다.

### 거리와 엄폐물 유무에 따른 명중률
![image](https://github.com/user-attachments/assets/9bf0eb47-d817-46b0-91eb-8925eee9f7ad)
![image](https://github.com/user-attachments/assets/af106b45-89de-40fc-8627-96b610387394)
- 명중률은 거리에 따라 멀어질수록 감소하며, 엄폐물이 있으면 더욱 감소한다. 엄폐물은 자신과 목표물의 중심에 선을 그어 목표물의 한 칸 거리 내에 엄폐물이 있을 경우 엄폐 상태로 간주한다.

### 시야 시스템
![image](https://github.com/user-attachments/assets/4ea15d1a-daa7-4c32-ba7f-17ea190d479c)
- 각 칸이 플레이어의 시야 범위 내에 있으면 선을 그어 중간에 막히는 벽이 있는지 확인 후 없으면 밝게 비춘다. 밝게 비추는 효과는 서피스를 이용하여 맵 전체를 덮는 어둠 스프라이트를 생성한 후 시야를 밝힐 칸만 구멍을 뚫었다.
