# golang_builder

golang特規編譯器，預設是限定產出 os:linux arch:amd64 的程式
會編譯這個腳本的原因是因為本身是使用mac的系統，
但產出的結果是需要在linux x86_64的環境且必要包含 CGO_ENABLED=1
所以作了一個docker images來在mac環境下生產執行檔

檔案說明
```
├── .dockerignore                   // 建立docker images時要忽略的列表
├── BuildExeDockerfile              // Dockerfile
├── ExeBuild.sh                     // [*]主要的執行腳本
├── LICENSE                         // LICENSE
└── README.md                       // 說明檔
```

使用方法
```
1.  將 .dockerignore, BuildExeDockerfile, ExeBuild.sh 三個檔案複制到 main.go 的資料夾中

2.  執行 sh ExeBuild.sh [DockerRepo] [RepoVersion] [APP_NAME]
    例如 sh ExeBuild.sh searobber/golangbuilder latest app_linux.exe

3.  檢查看看是不是有app_linux.exe，上傳到測試機器上進行測試

4.  如果有其他的編譯需求可以自行修改 BuildExeDockerfile 裡的建立參數
```