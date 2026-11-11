# Among Space PS3 — projeto corrigido

Este pacote organiza o protótipo e adiciona um fluxo explícito de build/PKG.

## Conteúdo
- `src/main.c`: protótipo SDL2 2D com movimento, tripulantes, tarefas e HUD.
- `Makefile`: teste em computador com SDL2.
- `Makefile.ps3`: compilação PPU e empacotamento `.pkg` com ferramentas PSL1GHT.
- `assets/ICON0.PNG`: ícone do aplicativo para o XMB.
- `ps3-env.example`: exemplo das variáveis do toolchain.

## Requisito que ainda não pode ser removido
O PS3 não compila este projeto sozinho: o computador/ambiente de build precisa ter
PS3DEV/PSL1GHT **e SDL2 compilado para PPU**. O erro da captura (`ppu-gcc: No such
file or directory`) significa que o compilador PS3 não está instalado ou não está
no caminho indicado. Este ZIP não contém o toolchain nem a biblioteca SDL2.

## Compilar no ambiente PS3DEV
No Linux/WSL, depois de instalar o toolchain e SDL2 para PS3:

```sh
export PS3DEV=/usr/local/ps3dev
export PSL1GHT=$PS3DEV
export PATH="$PS3DEV/bin:$PS3DEV/ppu/bin:$PS3DEV/spu/bin:$PATH"
make -f Makefile.ps3 check
make -f Makefile.ps3 pkg
```

Se o SDL2 estiver instalado em outro local, informe-o:
```sh
make -f Makefile.ps3 SDL2_PREFIX=/caminho/para/sdl2-ppu pkg
```

O resultado esperado é `build/among-space.pkg`.

## Teste em computador
Instale SDL2 de desktop e `sdl2-config`, então:
```sh
make
./among-space
```
Teclas: WASD/setas movem; E faz tarefa perto de um terminal; R abre/fecha reunião;
ESC sai. No controle: analógico esquerdo move, A interage, B reunião.

## Observações honestas
- O pacote ainda é um protótipo, não o jogo completo.
- Não foi compilado/testado em hardware PS3 nesta sessão.
- `APPID` no exemplo é um identificador provisório; troque por um ID exclusivo
  antes de distribuir.
- A compatibilidade final depende da versão do PSL1GHT, SDL2 para PS3 e HEN.
- A receita segue o fluxo de regras de pacote do PSL1GHT: SELF NPDRM, PARAM.SFO,
  ICON0.PNG e criação do PKG.
