# plantuml-server

plantumlで記述したUMLから画像を生成するためのサーバ

`plantuml/plantuml-server`を使うとフォントがイマイチなので，[Firple]を利用して画像生成するように変更している

## 例

1. サーバを起動

    ```
    docker-compose up -d plantuml-server
    ```

1. `example.puml`から`example.png`を生成する

    ```
    cat example/example.puml | curl -H "Content-Type: text/plain; charset=utf-8" --data-binary @- http://127.0.0.1:8080/png/ --output - > example/example.png
    ```

[Firple]:https://github.com/negset/Firple
