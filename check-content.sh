#!/bin/bash
FILE=$1

if [ ! -f "$FILE" ]; then
  echo "오류: $FILE 파일을 찾을 수 없습니다."
  exit 1
fi

echo "검수 시작: $FILE"
echo "---"

CHAR_COUNT=$(wc -m < "$FILE" | tr -d ' ')
echo "글자 수: ${CHAR_COUNT}자"
if [ "$CHAR_COUNT" -gt 5000 ]; then
  echo "경고: 5,000자를 초과했습니다! (${CHAR_COUNT}자)"
else
  echo "글자 수 통과"
fi

echo "---"
echo "금칙어 검사 중..."
FORBIDDEN_WORDS="이다솜 김민아 전현지 박예영"
FOUND=0
for WORD in $FORBIDDEN_WORDS; do
  if grep -q "$WORD" "$FILE"; then
    echo "금칙어 발견: $WORD"
    FOUND=1
  fi
done
if [ "$FOUND" -eq 0 ]; then
  echo "금칙어 없음"
fi

echo "---"
echo "검수 완료"