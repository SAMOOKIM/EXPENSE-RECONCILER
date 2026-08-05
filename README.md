# Expense Reconciler — Windows Portable EXE build

## 목적
최종 사용자는 Python, pip, Tesseract를 설치하지 않고 `Expense_Reconciler.exe`만 실행하는 형태를 목표로 합니다.

## 중요한 점
현재 작업 환경은 Linux이므로 Windows PE/EXE를 이 세션에서 직접 빌드할 수 없습니다.
따라서 이 폴더에는 **Windows에서 바로 빌드 가능한 패키지 + GitHub Actions 자동 빌드 설정**을 제공합니다.

### 가장 쉬운 방법: GitHub Actions
1. 이 프로젝트를 GitHub repository에 올립니다.
2. GitHub → Actions → `Build Windows Portable EXE` 선택.
3. `Run workflow` 실행.
4. 완료 후 `Expense_Reconciler_Portable` artifact에서 `Expense_Reconciler.exe`를 받습니다.
5. 대상 Windows PC에는 Python/Tesseract 설치가 필요 없습니다.

### 로컬 Windows에서 빌드
개발/빌드 PC에만 Python 3.11이 필요합니다.
`build_windows_portable.bat` 실행 → `dist\Expense_Reconciler.exe` 생성.

최종 사용자는 생성된 EXE만 받으면 됩니다.

## OCR
빌드 과정에서 Windows용 Tesseract 5.4.0.20240606과 함께 실행 파일 및 tessdata를 EXE에 포함합니다.
앱은 번들된 `tesseract.exe`를 우선 사용하므로 대상 PC의 PATH 설정이 필요 없습니다.

## 보안/개인정보
Excel/PDF는 로컬 Flask 서버(127.0.0.1)에서 처리합니다. 외부 서버로 업로드하지 않습니다.

## 주의
OCR은 영수증 양식과 이미지 품질에 따라 오류가 발생할 수 있습니다. 자동 판정은 회계 증빙의 최종 확정이 아니라 검토를 위한 보조 수단으로 사용하세요.
