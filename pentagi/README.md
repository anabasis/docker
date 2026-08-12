# 설치

```bash
# 환경설정
curl -o .env.example https://raw.githubusercontent.com/vxcontrol/pentagi/master/.env.example
curl -o .env https://raw.githubusercontent.com/vxcontrol/pentagi/master/.env.example
```

```bash
# 제공업체 설정
curl -o example.custom.provider.yml https://raw.githubusercontent.com/vxcontrol/pentagi/master/examples/configs/custom-openai.provider.yml
curl -o example.ollama.provider.yml https://raw.githubusercontent.com/vxcontrol/pentagi/master/examples/configs/ollama-llama318b.provider.yml
```

```bash
# Docker Compose 설정파일
curl -O https://raw.githubusercontent.com/vxcontrol/pentagi/master/docker-compose.yml
```


```bash
# 필수: 다음 LLM 제공업체 중 최소 하나
OPEN_AI_KEY=your_openai_key
ANTHROPIC_API_KEY=your_anthropic_key
GEMINI_API_KEY=your_gemini_key

# 선택: AWS Bedrock 제공업체
BEDROCK_REGION=us-east-1
BEDROCK_ACCESS_KEY_ID=your_aws_access_key
BEDROCK_SECRET_ACCESS_KEY=your_aws_secret_key

# 선택: 로컬 LLM 제공업체 (비용 없음)
OLLAMA_SERVER_URL=http://localhost:11434
OLLAMA_SERVER_MODEL=llama3.1:8b-instruct-q8_0

# 선택: 검색 엔진 기능
DUCKDUCKGO_ENABLED=true
GOOGLE_API_KEY=your_google_key
GOOGLE_CX_KEY=your_google_cx
TAVILY_API_KEY=your_tavily_key
```


```bash
# 주요 보안 설정
COOKIE_SIGNING_SALT=your_random_salt_here
PUBLIC_URL=https://pentagi.example.com

# 데이터베이스 자격 증명
PENTAGI_POSTGRES_USER=your_db_user
PENTAGI_POSTGRES_PASSWORD=your_secure_password
```

