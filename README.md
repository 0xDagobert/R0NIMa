# RoNIMa


```
██████╗  ██████╗ ███╗   ██╗██╗███╗   ███╗ █████╗ 
██╔══██╗██╔═████╗████╗  ██║██║████╗ ████║██╔══██╗
██████╔╝██║██╔██║██╔██╗ ██║██║██╔████╔██║███████║
██╔══██╗████╔╝██║██║╚██╗██║██║██║╚██╔╝██║██╔══██║
██║  ██║╚██████╔╝██║ ╚████║██║██║ ╚═╝ ██║██║  ██║
╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝
```


Stage 2 all in 1 McDonalds come as you are payload


## Install

1. Install Nim via [Choosenim](https://github.com/nim-lang/choosenim)


Linux

``` bash
    curl https://nim-lang.org/choosenim/init.sh -sSf | sh
```

Win 

Install [release](https://github.com/nim-lang/choosenim/releases)

2. Install dependencies

```
    nimble install winim
```


## Usage 


Compile main.nim (some compilation exmaples are in the cmp.json)

If you want to use C2 / discord exfil you have to add -d:ssl as compilation param


## Test

There us a docker compose file that will start a win11 environnement 
user: nim
pwd: nim

The /bin/ director is mapped to \\host.lan\Data 

Once compiled place your binaries inside the /bin/ to access them inside the win11 (no need to restart the docker to have them)

