{{- define "common.deployment.tpl" -}}
apiVersion: apps/v1
kind: Deployment
{{ template "common.metadata" . }}
spec:
  selector:
    matchLabels:
      app: {{ template "common.name" . }}
  template:
    metadata:
      labels:
        app: {{ template "common.name" . }}
        release: {{ .Release.Name | quote }}
    spec:
      containers:
        -
{{ include "common.container.tpl" .| indent 10 }}
{{- end -}}
{{- define "common.deployment" -}}
{{- template "common.util.merge" (append . "common.deployment.tpl") -}}
{{- end -}}