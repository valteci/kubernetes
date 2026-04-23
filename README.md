# 1. Baixe o kubectl no seu PC

# 2. Crie um cluster na nuvem via gcloud ou via UI web
* Recomendo criar com autopilot se você não tem experiência com kubernetes
* Ao usar o autopilot, será ativado um serviço de monitoramento chamado prometheus, não tem como desativá-lo, mas você pode desligar as métricas, o que vai diminuir o consumo do prometheus.

# 3. Conect o kubectl da sua máquina ao cluster da nuvem.
* O próprio GCP fornece o comando gcloud que você deve rodar no terminal.

# 4. Desative métricas de "cloud monitoring"
1. Vá em kubernetes engine
2. Na barra lateral, vá em clusters
3. Clique em cima do seu cluster
4. Clique em detalhes
5. Procure a opção "cloud monitoring" e clique no lápis ao lado dela.
6. Dos componentes selecionados, deixe apenas a opção "Sistema" e desative as outras.
7. Salve e espere as mudanças serem aplicadas.


# 5. Crie um namespace "lab" com configurações personalizadas
Se não quiser ficar rodando esses comandos toda vez, basta usar os scirpts lab-down.sh e lab-up.sh para subir e derrubar o namespace.

* Crie o seu lab:
```bash
kubectl create namespace lab
```

* Confirme se ele foi criado (você deve vê-lo na lista):
```bash
kubectl get namespaces
```

* Faça o kubernet usar esse namespace por padrão (opcional, mas útil):
```bash
kubectl config set-context --current --namespace=lab
```

* Confirme se o namespace está sendo usado mesmo:
```bash
kubectl config view --minify | grep namespace
```

* Caso queira voltar para o default, depois:
```bash
kubectl config set-context --current --namespace=default
```

* Delimite recursos menos "gordos" para os pods:
```bash
kubectl apply -f limitrange-lab.yaml
```

* Veja se os limites de fato foram aplicados:
```bash
kubectl -n lab describe limitrange lab-limits
```

* Limite o total de recursos por namespace, isso garante que o namespace inteiro não passe de um teto (o que pode limitar a escalabilidade vertical):
```bash
kubectl apply -f quota-lab.yaml
```

* Verifique se os limites de cota foram de fato aplicados:
```bash
kubectl -n lab describe quota lab-quota
```






# Aplicando arquivos de maneira declarativa:
```bash
kubectl apply -f pod.yaml
```

