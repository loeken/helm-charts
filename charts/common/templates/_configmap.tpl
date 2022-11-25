{{- define "common.configmap.tpl" -}}
apiVersion: v1
kind: ConfigMap
{{ template "common.metadata" . }}
data: {}
{{- end -}}
{{- define "common.configmap" -}}
{{- template "common.util.merge" (append . "common.configmap.tpl") -}}
{{- end -}}