# オーディオグラフの実装例

iOS 15.0から利用可能になったオーディオグラフ（Audio Graphs）の実装例です。

この実装例では日別の通信量（単位はGB）を棒グラフとして表示しています。この実装例はオーディオグラフを紹介することが目的のため、グラフの縦軸・横軸・目盛りなどの描画を省略しています。

## オーディオグラフの概要

オーディオグラフ（Audio Graphs）は視覚に障害のあるユーザーを想定したアクセシビリティ機能です。グラフにプロットされた値を音色の高低として再生することで、全体像を伝える機能です。

オーディオグラフはVoiceOverスクリーンリーダーを有効にすると利用可能になります。グラフにフォーカスを合わせた後に上下フリックをして「オーディオグラフを再生」と聞こえたらタップします。

さらに、オーディオグラフに準拠した実装をすると、OSが自動的にグラフの詳細画面を生成します。。グラフにフォーカスを合わせた後に上下フリックをして「グラフの詳細」が聞こえたらタップします。

## 参考資料

1. [Audio graphs - Apple Developer Documentation](https://developer.apple.com/documentation/accessibility/audio-graphs)
2. [Bring accessibility to charts in your app - WWDC21 Videos - Apple Developer](https://developer.apple.com/videos/play/wwdc2021/10122/)
