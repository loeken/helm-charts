{{- define "common.service.tpl" -}}
apiVersion: v1
kind: Service
metadata:
  name: release-name-heimdall
  labels:
    app.kubernetes.io/instance: release-name
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: heimdall
    app.kubernetes.io/version: 2.2.2
    helm.sh/chart: heimdall-8.4.2
  annotations:
spec:
  type: ClusterIP
  ports:
  - port: 80
    targetPort: http
    protocol: TCP
    name: http
  selector:
    app.kubernetes.io/name: heimdall
    app.kubernetes.io/instance: release-name
{{- end -}}
{{- define "common.service" -}}
{{- include "common.util.merge" (append . "common.service.tpl") -}}
{{- end -}}
