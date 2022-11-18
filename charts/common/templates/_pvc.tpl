{{- define "common.pvc.tpl" -}}
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: {{  printf "%s" .Chart.Name }}-config
  labels:
    app.kubernetes.io/instance: {{  printf "%s" .Chart.Name }}
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: {{  printf "%s" .Chart.Name }}
    app.kubernetes.io/version: {{ .Values.image.tag }}
    helm.sh/chart: {{  printf "%s" .Chart.Name }}-{{ .Values.image.tag }}
  annotations:
spec:
  accessModes:
    - "ReadWriteOnce"
  resources:
    requests:
      storage: "1Gi"
  storageClassName: "freenas-iscsi-csi"
{{- end -}}
{{- define "common.pvc" -}}
{{- include "common.util.merge" (append . "common.pvc.tpl") -}}
{{- end -}}