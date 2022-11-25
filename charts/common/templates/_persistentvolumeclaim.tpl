{{- define "common.persistentvolumeclaim.tpl" -}}
apiVersion: v1
kind: PersistentVolumeClaim
{{ template "common.metadata" . }}
spec:
  accessModes:
    - {{ .Values.persistence.accessMode | quote }}
  resources:
    requests:
      storage: {{ .Values.persistence.size | quote }}
{{- if .Values.persistence.storageClass }}
{{- if (eq "-" .Values.persistence.storageClass) }}
  storageClassName: ""
{{- else }}
  storageClassName: "{{ .Values.persistence.storageClass }}"
{{- end }}
{{- end }}
{{- end -}}
{{- define "common.persistentvolumeclaim" -}}
{{- $top := first . -}}
{{- if and $top.Values.persistence.enabled (not $top.Values.persistence.existingClaim) -}}
{{- template "common.util.merge" (append . "common.persistentvolumeclaim.tpl") -}}
{{- end -}}
{{- end -}}