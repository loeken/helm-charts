{{- define "common.cronjob.tpl" -}}
apiVersion: batch/v1
kind: CronJob
{{ template "common.metadata" . }}
spec:
  schedule: {{ quote .Values.cronjob.schedule }}
  concurrencyPolicy: Forbid
  startingDeadlineSeconds: 200
  jobTemplate:
    spec:
      template:
        metadata:
          labels:
            app: {{ template "common.name" . }}
            release: {{ .Release.Name | quote }}
          {{- if .Values.linkerd.inject }}
          annotations:
            linkerd.io/inject: enabled
          {{- end }}
        spec:
          imagePullSecrets:
          {{ toYaml .Values.cronjob.imagePullSecrets | indent 2 }}
          containers:
            -
{{ include "common.container_cronjob.tpl" . | indent 14 }}
{{- end -}}
{{- define "common.cronjob" -}}
{{- template "common.util.merge" (append . "common.cronjob.tpl") -}}
{{- end -}}
