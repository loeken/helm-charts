{{- define "common.service.tpl" -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ .Release.Name | printf "%s-%s" .Chart.Name }}
  labels:
    app.kubernetes.io/instance: release-name
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: {{ .Release.Name | printf "%s-%s" .Chart.Name }}
    app.kubernetes.io/version: {{ .Values.image.tag }}
    helm.sh/chart: {{ .Release.Name | printf "%s-%s" .Chart.Name }}-{{ .Values.image.tag }}
  annotations:
spec:
  type: ClusterIP
  ports:
  - port: 80
    targetPort: http
    protocol: TCP
    name: http
  selector:
    app.kubernetes.io/name: {{ .Release.Name | printf "%s-%s" .Chart.Name }}
    app.kubernetes.io/instance: {{ .Release.Name | printf "%s-%s" .Chart.Name }}
{{- end -}}
{{- define "common.service" -}}
{{- include "common.util.merge" (append . "common.service.tpl") -}}
{{- end -}}
