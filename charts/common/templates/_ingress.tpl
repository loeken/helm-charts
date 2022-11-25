{{- define "common.ingress.tpl" -}}
apiVersion: networking.k8s.io/v1
kind: Ingress
{{ template "common.metadata" . }}
  {{- if .Values.ingress.annotations }}
  annotations:
{{ toYaml .Values.ingress.annotations | indent 4 }}
  {{- end }}
spec:
  rules:
  {{- range $host := .Values.ingress.hosts }}
  - host: {{ $host.host }}
    http:
      paths:
{{ toYaml $host.paths |indent 6 }}
  {{- end }}
  {{- if .Values.ingress.tls }}
  tls:
{{ toYaml .Values.ingress.tls | indent 4 }}
  {{- end -}}
{{- end -}}
{{- define "common.ingress" -}}
{{- template "common.util.merge" (append . "common.ingress.tpl") -}}
{{- end -}}
