# docker

docker

- docker dockerfile docker-compose
- docker-compose中如果指定网络，端口不一定能够暴露出来，如果-p没有暴露出来，可以不指定docker中的网络，直接使用docker0即可。
- many function to test:
  - changelog
  - husky
    - husky安装：`npx husky install`
    - husky添加git hooks：`npx husky add .husky/pre-commit "echo hello"`，自己到.husky/pre-commit再添加对应的处理
    - husky添加git hooks：`npx husky add .husky/pre-push "echo push"`，自己到.husky/pre-push再添加对应的处理
    - npx husky add .husky/commit-msg 'npx --no-install commitlint --edit "$1"'

  - env_file in docker-compose
