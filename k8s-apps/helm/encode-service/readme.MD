
# Resiliency Best Practices

## 👉 Readiness & Liveness Probes
## 👉 Resource Requests & Limits

## 👉 Pod Disruption Budgets (PDB)
  <li> PDB protects the application’s availability from disruptions <br>

```
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: encode-pdb
  namespace: encode
spec:
  minAvailable: 2
  selector:
    matchLabels:
      app: encode-service
```
<li>A PDB only applies to <b>voluntary disruptions</b> such as: ( when i say this , if you you reduce replica and it violates PDB, it wont stop reducing the pods , but generates an event with PDB )

<li>Node drains (e.g. during node maintenance), Evictions (like due to taints, preemption, etc.) , Rolling updates
, Cluster autoscaler removing nodes

## 👉 Graceful Shutdown & PreStop Hook
## 👉 Horizontal Pod Autoscaling (HPA)
## 👉 Service Mesh
## 👉 Circuit Breakers in App Code

## 👉 Affnity and AntiAffnity 

#### ✅ Affinity: "Place the pod here, if the node matches the label."
#### 🚫 Anti-Affinity: "Do not place the pod here, if the node has a matching label."

✌️ Note for Anti affinity - When a pod is initially scheduled on a node, anti-affinity rules do not apply to it (since it's the first pod), and it can be scheduled on any node. Only subsequent pods that are being scheduled are affected by the anti-affinity rules.

```
affinity:
  podAntiAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      - labelSelector:
          matchLabels:
            app: encode-service
        topologyKey: kubernetes.io/hostname
```

##### requiredDuringSchedulingIgnoredDuringExecution , preferredDuringSchedulingIgnoredDuringExecution 
 <li> <b>IgnoredDuringExecution</b> Applies when pod is scheduled and not while pod is running. <br>
 <li> <b>requiredDuringScheduling</b> - mandatory for scheduling  , <b>preferredDuringScheduling</b> - not mandatory for scheduling 

##### topologyKey - Tells which domain to consider 
 ✌️ Host, AZ, Region , Data Center etc. 
  
## 👉 Taints and Tolerations 

```
spec:
  tolerations:
    - key: "critical"
      operator: "Equal"
      value: "true"
      effect: "NoSchedule"
```

The real difference between `NoSchedule`, `PreferNoSchedule`, and `NoExecute` only shows up **when the pod does not have a matching toleration**.

#### 🟥 NoSchedule
- **No toleration?** → 🚫 Pod will **never** be scheduled on that node.
- **With toleration?** → ✅ scheduled.

#### 🟧 PreferNoSchedule
- **No toleration?** → 😕 Scheduler **tries to avoid** this node, but **may schedule** it anyway if no better options.
- **With toleration?** → ✅ scheduled.

#### ⬛ NoExecute
- **No toleration?** → 🚫 Pod will be **evicted** from the node if it's already running there and will not be scheduled there again.
- **With toleration?** → ✅ scheduled.

> 💡 You can even say: “Stay for 60 seconds and then get evicted” using `tolerationSeconds`.

### 👉  topologySpreadConstraints
while Taints / Tolerations  and Affinity /Anti Affinity Talks about Node Suitability and Pod to Pod Relationship  , topologySpreadConstraints talks about distribution of pods across zones and regions 

```
topologySpreadConstraints:
        - maxSkew: 1
          topologyKey: topology.kubernetes.io/zone
          whenUnsatisfiable: ScheduleAnyway
          labelSelector:
            matchLabels:
              app: encode-service
```






 
