#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ░░░░ @see website https://just.systems/
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Este é um justfile — um gerenciador de tarefas simples e poderoso.
# Use `just <comando>` para executar as tarefas definidas aqui.
#
# Exemplo de uso:
#   $ just prepare
#
# Para instalar o just, execute:
#   $ cargo install just
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# 📋 Tarefa padrão: lista todos os comandos disponíveis no justfile
[group('help')]
default: help

# 📜 Exibe esta lista de comandos disponíveis
[group('help')]
help:
	@just --list --unsorted --list-heading $'' --list-prefix 'just '

#────────────────────────────────────────────────────────────────────────────
# 🔁 Ciclo de vida do projeto
#────────────────────────────────────────────────────────────────────────────
# 🚦 Tarefa principal: prepara e executa o fluxo completo do projeto
[group('lifecycle')]
boot: init check install format lint build

#────────────────────────────────────────────────────────────────────────────
# 🔧 Preparação do ambiente
#────────────────────────────────────────────────────────────────────────────
# 🔧 Inicializa configurações ou recursos necessários para o projeto
[group('setup')]
init *args:
	@just -f recipes/init.just {{args}}

#────────────────────────────────────────────────────────────────────────────
# ✅ Verificação e Qualidade
#────────────────────────────────────────────────────────────────────────────
# ✔️ Executa verificações para garantir que o ambiente está configurado corretamente
[group('quality')]
check *args:
	@just -f recipes/check.just {{args}}

# 📝 Formata arquivos e manipula dados relacionados ao git
[group('quality')]
format *args:
	@just -f recipes/format.just {{args}}

# 🧹 Executa todas as verificações de linting e conformidade do projeto
[group('quality')]
lint *args:
	@just -f recipes/lint.just {{args}}

#────────────────────────────────────────────────────────────────────────────
# 📦 Dependências
#────────────────────────────────────────────────────────────────────────────
# 📥 Instala dependências necessárias ao projeto
[group('deps')]
install *args:
	@just -f recipes/install.just {{args}}

# 🚫 Desinstala dependências necessárias ao projeto
[group('deps')]
uninstall *args:
	@just -f recipes/uninstall.just {{args}}

#────────────────────────────────────────────────────────────────────────────
# 💻 Dev — Comandos para gerenciar containers e ambiente de desenvolvimento
#────────────────────────────────────────────────────────────────────────────
# 🐳 Comandos Docker
[group('dev')]
docker *args:
	@just -f recipes/docker.just {{args}}

# 🧪 Ambiente de Desenvolvimento
[group('dev')]
dev *args:
	@just -f recipes/dev.just {{args}}

#────────────────────────────────────────────────────────────────────────────
# 🏗️ Build — Compilação, geração de código e construção
#────────────────────────────────────────────────────────────────────────────
# 🏗️ Geração de código, compilação e construção de artefatos
[group('build')]
build *args:
	@just -f recipes/build.just {{args}}

#────────────────────────────────────────────────────────────────────────────
# 🛠️ Extras / Utilitários
#────────────────────────────────────────────────────────────────────────────
# 🔐 Gerencia a construção e configuração do SSL
[group('extras')]
ssl *args:
	@just -f recipes/ssl.just {{args}}

# 🌿 Executa comandos relacionados ao git, como commit, push, etc.
[group('extras')]
git *args:
	@just -f recipes/git.just {{args}}
