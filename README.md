# plantuml-server

plantumlで記述したUMLから画像を生成するためのサーバ

`plantuml/plantuml-server`を使うとフォントがイマイチなので，[Firple]を利用して画像生成するように変更している

## 例

`example.puml`から`example.png`を生成する

```
cat example.puml | curl --silent -H "Content-Type: text/plain; charset=utf-8" --data-binary @- http://plantuml:8080/png/ --output - > example.png
```
[Firple]:https://github.com/negset/Firple
