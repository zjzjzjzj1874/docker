# docker

docker

- docker dockerfile docker-compose
- many function to test:
  - changelog
  - husky
    - husky安装：`npx husky install`
    - husky添加git hooks：`npx husky add .husky/pre-commit "echo hello"`，自己到.husky/pre-commit再添加对应的处理
    - npx husky add .husky/commit-msg 'npx --no-install commitlint --edit "$1"'

  - env_file in docker-compose
