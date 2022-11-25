{{- define "common.container_cronjob.tpl" -}}
name: {{ .Chart.Name }}
image: "{{ .Values.cronjob.image.repository }}/{{ .Values.cronjob.image.group }}/{{ .Values.cronjob.image.name }}:{{ .Values.cronjob.image.tag }}"
imagePullPolicy: {{ .Values.cronjob.image.pullPolicy }}
ports:
- name: http
  containerPort: 80
resources:
{{ toYaml .Values.cronjob.resources | indent 2 }}
livenessProbe:
  httpGet:
    path: /
    port: 80
readinessProbe:
  httpGet:
    path: /
    port: 80
{{ if and ( eq .Values.persistence.enabled false ) (eq .Values.configmap.enabled false) }}
volumeMounts: []
{{ else }}
volumeMounts:
{{- end}}
{{ if eq .Values.persistence.enabled true }}
  - name: pvc-{{ .Values.persistence.name }}
    mountPath: {{ .Values.persistence.path }}
{{- end -}}
{{ if eq .Values.configmap.enabled true }}
  - name: cm-{{ .Values.configmap.name }}
    mountPath: {{ .Values.configmap.path }}
{{- end -}}
{{- end -}}
{{- define "common.container_cronjob" -}}
{{- /* clear new line so indentation works correctly */ -}}
{{- println "" -}}
{{- include "common.util.merge" (append . "common.container_cronjob.tpl") | indent 12 -}}
{{- end -}}