# tech-writing

日本語で技術文書・書籍原稿を書くための Claude Code スキルを、1コマンドで入れられるようにしたプラグインです。

## 作者へのクレジット

このプラグインのスキルは、すべて **鹿野さん（[@k16shikano](https://github.com/k16shikano) / Keiichiro Shikano）** が書いたものです。
このリポジトリは、鹿野さんが公開している gist を、スキル間の依存関係ごとプラグインとして束ねただけで、規範の内容は鹿野さんの著作です。

| スキル | 内容 | 出典（取得時点のリビジョン） |
| --- | --- | --- |
| `japanese-tech-writing` | 段落と論証、論証の厳密さ、読み手の負荷、LLM 口調と翻訳調の禁止、冗長の排除などの文章規範 | [gist](https://gist.github.com/k16shikano/fd287c3133457c4fd8f5601d34aa817d)（`8f2d5761`） |
| `cognitive-rhythm-writing` | 文章の緩急を認知モードの切替として設計する規範と、執筆後の点検手順 | [gist](https://gist.github.com/k16shikano/eb2929f13ed19c97188393d297be8432)（`a3b1e26b`） |

ライセンスは鹿野さんの宣言（[License for my snippet on gist](https://gist.github.com/k16shikano/67625f2a7d96e3bbdfae8d571a936063)）に従い、public gist に適用される Unlicense です。全文は [LICENSE](LICENSE) にあります。

このプラグインとしてまとめた（パッケージングした）のは [kmizu](https://github.com/kmizu) です。

## 問い合わせ・不具合報告・免責

このプラグインの利用に関する質問、不具合の報告、要望は、鹿野さんではなく、**このリポジトリの [Issues](https://github.com/kmizu/tech-writing/issues)** に送ってください。鹿野さんに問い合わせないようお願いします。

- プラグインの構成、インストール、同期スクリプト、上流からの差分に起因する問題は、まとめた kmizu が窓口になります。
- スキルの規範そのものへの意見も、まずこのリポジトリに寄せてください。上流への反映が必要なら、kmizu が判断します。
- 本プラグインは現状有姿（AS IS）で提供し、利用によって生じたいかなる損害にも責任を負いません。これは [LICENSE](LICENSE) の免責条項のとおりです。
- スキルは鹿野さんが公開した gist を元にしていますが、鹿野さんがこのプラグインを監修・保証しているわけではありません。

## なぜプラグインにしたか

`cognitive-rhythm-writing` は作業前に `japanese-tech-writing` を読む前提で書かれており、`../japanese-tech-writing/SKILL.md` を相対パスで参照しています。
gist を1つずつ手でコピーすると、依存先を入れ忘れたり、ディレクトリの相対位置がずれたりします。
このプラグインは2つのスキルを兄弟ディレクトリ（`skills/`）に置くので、参照がそのまま成り立ちます。

## インストール

```
/plugin marketplace add kmizu/tech-writing
/plugin install tech-writing@tech-writing
```

インストール後は、日本語で技術文書を書く・推敲するときに `japanese-tech-writing` が、読み物として読ませたい文章を書く・直すときに `cognitive-rhythm-writing` が、それぞれスキルの description に従って呼び出されます。

## 上流との差分

スキル本文は上流のままです。変更は次の2点だけです。

1. `cognitive-rhythm-writing` の「併用する規範」を、パス（`../japanese-tech-writing/SKILL.md`）に加えてスキル名（`japanese-tech-writing`）でも指すようにした
2. `cognitive-rhythm-writing` の frontmatter に `license` を追加した（`japanese-tech-writing` にはもともとある）

上流の更新を取り込むには `scripts/sync-upstream.sh` を実行します。上の2点を自動で当て直します。

## 含めていないもの

鹿野さんの gist には、ラムダノート向けの執筆ガイド「記事の書き方」もありますが、スキルではなく、`japanese-tech-writing` との依存もないため含めていません。
