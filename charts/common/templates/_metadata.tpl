{{- /*
common.metadata creates a standard metadata header.
It creates a 'metadata:' section with name and labels.
*/ -}}
{{ define "common.metadata" -}}
metadata:
  name: {{ template "common.fullname" . }}
  {{- if .Values.linkerd.inject }}
  annotations:
    linkerd.io/inject: enabled
  {{- end }}
  labels:
{{ include "common.labels.standard" . | indent 4 -}}
{{- end -}}