Integração do Cobre Grátis com o Wufoo.
=================

Esse é o código usado no middleware de integração do Cobre Grátis com o Wufoo para quem deseja ter um formulário em seu site em que o próprio cliente possa gerar o seu boleto bancário.

O [Cobre Grátis] [cg] é um sistema de emissão e gerenciamento de boletos bancários.
O [Wufoo] [wufoo] é um sistema de criação de formulários.

É necessário ter contratado o Plano Premium do [Cobre Grátis] [cg].

Para usufruir da integração, não é necessário usar este código de programação. Basta usar o serviço hospedado.

[Vídeo explicativo de como configurar a integração] [video]

Em resumo, é necessário criar um formulário no Wufoo com os campos:

> Campo: **Data de Vencimento**<br>
Field Type: **Date**<br>
Required: **true**<br>
CSS Layout Keywords: **expire_at**

> Campo: **Valor**<br>
Field Type: **Single Line Text**<br>
Formato: **99,99**<br>
Required: **true**<br>
CSS Layout Keywords: **amount**<br>

> Campo: **Nome do Sacado**<br>
Field Type: **Single Line Text**<br>
Required: **true**<br>
CSS Layout Keywords: **name**<br>

> Campo: **E-mail**<br>
Field Type: **Email**<br>
CSS Layout Keywords: **email**<br>

> Campo: **Endereço**<br>
Field Type: **Address**<br>
CSS Layout Keywords: **address**<br>

Após criar o formulário, é necessário cadastrar uma Notificação:

* Acesse o Notification Settings do formulário criado;
* Selecione **WebHook** na área de inclusão de nova notificação;
* Clique em Add Integration;
* Em _Your WebHook URL_ coloque o endereço: **https://cobregratis-wufoo.herokuapp.com/IDSERVICO/IDCONTA** onde IDSERVICO é o ID do Serviço e o IDCONTA é o ID da Conta do Cobre Grátis;<br>
Para pegar o ID do Serviço e o ID da Conta, acesse a [página Integração do Cobre Grátis] [integration]
* Em _Your WebHook Handshake Key_ coloque o Token de Autenticação do seu usuário no Cobre Grátis;<br>
Para pegar o Token de Autenticação do seu usuário, acesse a [página Meu Perfil do Cobre Grátis] [myinfo]
* Marque a opção: _Include Field and Form Structures with Entry Data_;
* Clique em _Save_
* Acesso o formulário e faça um teste;
* Entre novamente do Notification Settings do formulário criado e verifique se existe alguma mensagem de erro;
* Em caso de dúvidas, abra um ticket no [suporte] [support].

  [cg]: http://cobregratis.com.br
  [wufoo]: http://wufoo.com
  [video]: http://screencast.com/t/qdbGoccFEQj
  [integration]: https://app.cobregratis.com.br/integration
  [myinfo]: https://app.cobregratis.com.br/myinfo
  [support]: http://suporte.cobregratis.com.br