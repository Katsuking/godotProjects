### Assets

使用する Assets は下記から取得
[itch.io](https://itch.io/profile/cupnooble)

/Art ディレクトリに配置していく。

### Player

Player 操作に使用するスクリプトについて

```gotdot
extends CharacterBody2D

func _physics_process(delta):
	pass
```

`_physics_process(delta)` とはなにか?
[physics process](https://docs.godotengine.org/en/stable/tutorials/scripting/idle_and_physics_processing.html#doc-idle-and-physics-processing)
簡単にいえば、ゲームが開始されてから変化する世界の状態を描写するもの

delta は基本使うと思うけど、`func _physics_process(_delta):` のように\_をつければ、変数を使用しないようにできる。

### Animation

character にアニメーションを使う場合は、
`AnimationTree`と`AnimationPlayer`の両方が必要
