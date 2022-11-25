{{- define "common.service.tpl" -}}
apiVersion: v1
kind: Service
{{ template "common.metadata" . }}
spec:
  type: ClusterIP
  ports:
  - name: http
    port: 80
    targetPort: http
  selector:
    app: {{ template "common.name" . }}
    release: {{ .Release.Name | quote }}
{{- end -}}
{{- define "common.service" -}}
{{- template "common.util.merge" (append . "common.service.tpl") -}}
{{- end -}}