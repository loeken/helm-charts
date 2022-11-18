{{- define "common.deployment.tpl" -}}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{  printf "%s" .Chart.Name }}
  labels:
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: {{  printf "%s" .Chart.Name }}
    app.kubernetes.io/version: {{ .Values.image.tag }}
    app.kubernetes.io/instance: {{  printf "%s" .Chart.Name }}
    helm.sh/chart: {{  printf "%s" .Chart.Name }}-{{ .Values.image.tag }}
spec:
  revisionHistoryLimit: 3
  replicas: {{ .Values.replicaCount }}
  strategy:
    type: Recreate
  selector:
    matchLabels:
      app.kubernetes.io/name: {{  printf "%s" .Chart.Name }}
      app.kubernetes.io/instance: {{  printf "%s" .Chart.Name }}
  template:
    metadata:
      labels:
        app.kubernetes.io/name: {{  printf "%s" .Chart.Name }}
        app.kubernetes.io/instance: {{  printf "%s" .Chart.Name }}
    spec:
      
      serviceAccountName: default
      automountServiceAccountToken: true
      dnsPolicy: ClusterFirst
      enableServiceLinks: true
      containers:
        - name: {{  printf "%s" .Chart.Name }}
          image: "linuxserver/{{  printf "%s" .Chart.Name }}:{{ .Values.image.tag }}"
          imagePullPolicy: IfNotPresent
          env:
            - name: PGID
              value: "1000"
            - name: PUID
              value: "1000"
            - name: TZ
              value: UTC
          ports:
            - name: http
              containerPort: 80
              protocol: TCP
          livenessProbe:
            tcpSocket:
              port: 80
            initialDelaySeconds: 0
            failureThreshold: 3
            timeoutSeconds: 1
            periodSeconds: 10
          readinessProbe:
            tcpSocket:
              port: 80
            initialDelaySeconds: 0
            failureThreshold: 3
            timeoutSeconds: 1
            periodSeconds: 10
          startupProbe:
            tcpSocket:
              port: 80
            initialDelaySeconds: 0
            failureThreshold: 30
            timeoutSeconds: 1
            periodSeconds: 5
          resources: {{ $.Values.resources | toYaml | trim | nindent 12 }}  
{{- end -}}
{{- define "common.deployment" -}}
{{- include "common.util.merge" (append . "common.deployment.tpl") -}}
{{- end -}}