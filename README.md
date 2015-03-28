# macbook-provisioning

Playbookの実行
---
inventoryファイルを指定し、ansible-playbookコマンドを実行する。
```
ansible-playbook localhost.yml -i hosts
```

### -vv オプション
コンソールに実行時の詳細なメッセージが表示されます。
```
ansible-playbook -vv localhost.yml -i hosts
```

### -C, --check オプション
Dry run実行となり実際にはローカル環境は変更されません。  
```
ansible-playbook -C localhost.yml -i hosts
```

### 後処理
```
brew cleanup
brew cask cleanup
```

参考文献
-------
- [Mac の開発環境構築を自動化する (2015 年初旬編)](http://t-wada.hatenablog.jp/entry/mac-provisioning-by-ansible)
- [HomebrewとAnsibleでMacの開発環境構築を自動化する](http://mawatari.jp/archives/mac-provisioning-by-homebrew-and-ansible)
