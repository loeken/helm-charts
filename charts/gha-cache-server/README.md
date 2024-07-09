requires a secrret such as:


apiVersion: v1
kind: Secret
metadata:
  name: cache-secret
  namespace: cache
type: Opaque
stringData:
  cacheServerToken: 3o9AeSDdCjMtpRP4TVt
