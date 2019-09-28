# SEGGER_RTT

Esse repositório contém uma biblioteca com a implementação do real-time transfer da SEGGER.

Essa biblioteca foi feita para ser utilizada como submódulo no [STM32ProjectTemplate](https://github.com/ThundeRatz/STM32ProjectTemplate).

Os arquivos podem ser obtidos no [site da SEGGER](https://www.segger.com/products/debug-probes/j-link/technology/about-real-time-transfer/).


 ## Adicionando o submódulo ao projeto

Crie um diretório chamado `lib`, caso não exista:

```bash
mkdir lib
```
E adicione o submódulo fazendo:

* Com HTTPS:
```bash
git submodule add --name SEGGER_RTT https://github.com/ThundeRatz/SEGGER_RTT.git lib/SEGGER_RTT
```

* Com SSH:
```bash
git submodule add --name SEGGER_RTT git@github.com:ThundeRatz/SEGGER_RTT.git lib/SEGGER_RTT
```


## Modificações na biblioteca básica

Foi evitado mexer nos arquivos básicos fornecidos pela SEGGER, foram feitas somente as seguintes modificações devido à versão do `arm-gcc`. As modificações foram feitas somente no arquivo `SEGGER_RTT_Syscalls_GCC.c`.

O arquivo original era:

```C
int _write_r(struct _reent *r, int file, const void *ptr, int len); /** Na linha 87 */

/** Continuação */

int _write_r(struct _reent *r, int file, const void *ptr, int len) { /** Na linha 122 */
```

No arquivo modificado se tem:

```C
_ssize_t _write_r(struct _reent *r, int file, const void *ptr, size_t len); /** Na linha 87 */

/** Continuação */

_ssize_t _write_r(struct _reent *r, int file, const void *ptr, size_t len) { /** Na linha 122 */
```

---------------------

Equipe ThundeRatz de Robótica
