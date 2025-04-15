
##  Affnity and AntiAffnity 




## Taints and Tolerations 

```
spec:
  tolerations:
    - key: "critical"
      operator: "Equal"
      value: "true"
      effect: "NoSchedule"
```

The real difference between `NoSchedule`, `PreferNoSchedule`, and `NoExecute` only shows up **when the pod does not have a matching toleration**.

Here's how it plays out:

### 🟥 NoSchedule
- **No toleration?** → 🚫 Pod will **never** be scheduled on that node.
- **With toleration?** → ✅ scheduled.

### 🟧 PreferNoSchedule
- **No toleration?** → 😕 Scheduler **tries to avoid** this node, but **may schedule** it anyway if no better options.
- **With toleration?** → ✅ scheduled.

### ⬛ NoExecute
- **No toleration?** → 🚫 Pod will be **evicted** from the node if it's already running there and will not be scheduled there again.
- **With toleration?** → ✅ scheduled.

> 💡 You can even say: “Stay for 60 seconds and then get evicted” using `tolerationSeconds`.





 
