# Cocktail Cloud APM
Helm chart for Cocktail Cloud APM

## Values

| Parameter                           | Description                                                                                                     | Type   | Default                             |
| ----------------------------------- | --------------------------------------------------------------------------------------------------------------- | ------ | ----------------------------------- |
| global.imageRegistry                | The Image registry to pull from in all pods.                                                                    | string | registry.rnd.local                  |
| global.imagePullPolicy              | The Pull Policy to use for images in all pods.                                                                  | string | IfNotPresent                        |
| global.imagePullSecret.enable       | Specifies whether a imagePullSecret should be set.                                                              | bool   | false                               |
| global.imagePullSecret.name         | The name of the kubernetes secret to pull from the image registry.                                              | string | regcred                             |
| global.imagePullSecret.create       | if true, kubernetes secret will be created with below registryCredentials.                                      | bool   | false                               |
| global.registryCredentials.username | username for image registry to pull from.                                                                       | string | “”                                  |
| global.registryCredentials.password | password for image registry to pull from.                                                                       | string | “”                                  |
| global.registryCredentials.email    | email for image registry to pull from.                                                                          | string | “”                                  |
| global.timezone                     | Timezone to use for all pods.                                                                                   | string | Asia/Seoul                          |
| omApm.image.repository              | The Image Repository of the OPENMARU APM.                                                                       | string | om-helm/openmaru-apm                |
| omApm.image.tag                     | The Image tag of the OPENMARU APM.                                                                              | string | 5.1.0-10.0.1                        |
| omApm.env                           | The additional environment variables to be set on the openmaru-apm pods.                                        | list   | []                                  |
| omApm.nodeSelector                  | The node selector to use for openmaru-apm pods.                                                                 | object | {}                                  |
| omApm.affinity                      | The affinity to use for openmaru-apm pods                                                                       | object | {}                                  |
| omApm.tolerations                   | The Tolerations to use for openmaru-apm pods.                                                                   | list   | []                                  |
| omApm.resources                     | The Resources to be allocated for openmaru-apm pods.                                                            | object | {}                                  |
| omApm.service.annotations           | The Annotations to be added to the openmaru-apm service object.                                                 | object | {}                                  |
| omApm.service.type                  | The type of service to create for openmaru-apm.                                                                 | string | ClusterIP                           |
| omApm.ingress.enabled               | Create an ingress resource for openmaru-apm.                                                                    | bool   | true                                |
| omApm.ingress.ingressClassName      | The ingress class to use for openmaru-apm.                                                                      | string | nginx                               |
| omApm.ingress.annotations           | Annotations to be added to the ingress. websocket is required for the openmaru-apm agents to work properly.     | object | {}                                  |
| omApm.ingress.path                  | The path of openmaru-apm Application context.                                                                   | string | /                                   |
| omApm.ingress.pathType              | pathType is only for k8s >= 1.1=                                                                                | string | Prefix                              |
| omApm.ingress.hosts                 | The hosts to use for openmaru-apm ingress.                                                                      | list   | [ openmaru-apm.openmaru.io ]        |
| omApm.ingress.extraPaths            | Extra paths to prepend to every host configuration. This is useful when working with annotation based services. | list   | []                                  |
| omApm.ingress.tls                   | TLS configuration for openmaru-apm ingress.                                                                     | list   | []                                  |
| influxdb.image.repository           | The image repository to pull from for the influxdb image                                                        | string | om-helm/influxdb                    |
| influxdb.image.tag                  | The image tag to pull for the influxdb image                                                                    | string | 2.7.3-openmaru-security             |
| influxdb.nodeSelector               | Node Selector to use for influxdb pods.                                                                         | object | {}                                  |
| influxdb.affinity                   | The affinity to use for influxdb pods.                                                                          | object | {}                                  |
| influxdb.tolerations                | The tolerations to use for influxdb pods                                                                        | string | []                                  |
| influxdb.resources                  | The Resources to be allocated for influxdb pods                                                                 | object | {}                                  |
| influxdb.pvc.create                 | Create influxdb PVC.                                                                                            | string | true                                |
| influxdb.pvc.accessModes            | The access mode of the influxdb PVC.                                                                            | string | ReadWriteOnce                       |
| influxdb.pvc.size                   | The size of the influxdb PVC.                                                                                   | string | 10Gi                                |
| influxdb.pvc.storageClassName       | The storage class to use for the influxdb PVC.                                                                  | string | fs-client                           |
| mongodb.image.repository            | The image repository to pull from for the mongodb image                                                         | string | om-helm/mongo                       |
| mongodb.image.tag                   | The image tag to pull for the mongodb image## The image tag to pull for the mongodb image                       | string | 7.0.2-openmaru-security             |
| mongodb.nodeSelector                | Node Selector to use for mongodb pods.                                                                          | object | {}                                  |
| mongodb.affinity                    | The affinity to use for mongodb pods.                                                                           | object | {}                                  |
| mongodb.tolerations                 | The tolerations to use for mongodb pods.                                                                        | list   | []                                  |
| mongodb.resources                   | The Resources to be allocated for mongodb pods                                                                  | object | {}                                  |
| mongodb.pvc.create                  | Create mongodb PVC.                                                                                             | string | true                                |
| mongodb.pvc.accessModes             | The access mode of the mongodb PVC.                                                                             | string | ReadWriteOnce                       |
| mongodb.pvc.size                    | The size of the mongodb PVC                                                                                     | string | 10Gi                                |
| mongodb.pvc.storageClassName        | The storage class to use for the mongodb PVC.                                                                   | string | nfs-client                          |
| rabbitmq.image.repository           | The image repository to pull from for the rabbitmq image                                                        | string | om-helm/rabbitmq                    |
| rabbitmq.image.tag                  | The image tag to pull for the rabbitmq image                                                                    | string | 3.12.7-management-openmaru-security |
| rabbitmq.nodeSelector               | The nodeSelector to use for rabbitmq pods.                                                                      | object | {}                                  |
| rabbitmq.affinity                   | The affinity to use for rabbitmq pods.                                                                          | object | {}                                  |
| rabbitmq.tolerations                | The tolerations to use for rabbitmq pods                                                                        | list   | []                                  |
| rabbitmq.resources                  | The Resources to be allocated for rabbitmq pods.                                                                | object | {}                                  |
| redis.image.repository              | The image repository to pull from for the redis image                                                           | string | om-helm/redis                       |
| redis.image.tag                     | The image tag to pull for the redis image                                                                       | string | 7.0.14-openmaru-security            |
| redis.nodeSelector                  | The nodeSelector to use for redis pods.                                                                         | object | {}                                  |
| redis.affinity                      | The affinity to use for redis pods.                                                                             | object | {}                                  |
| redis.tolerations                   | The tolerations to use for redis pods.                                                                          | list   | []                                  |
| redis.resources                     | The Resources to be allocated for redis pods                                                                    | objct  | {}                                  |
