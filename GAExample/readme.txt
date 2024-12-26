이 파일들은 매트랩을 통해 GA를 수행하는 방법을 보여주기 위한 간단한 시스템이다

우선 GAExample이라는 코드가 main에 해당하며 evaluateConstraint랑 evaluateFitness 함수는
매트랩 내장 GA가 불러들이는 함수들이다.

evaluateConstraint는 내장 GA가 뱉어내는 chromosome을 받아서 내가 작성한 constraint를 맞출 수 있는지 살펴주는 함수

evaluateFitness 함수는 각 chromosome을 받아와서 objective들을 계산해주는 함수다.