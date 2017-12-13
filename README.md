# k8s-chaos-monkey
Simple bash + python scripts for kubernetes chaos moneky

        env:
        - name: CHAOS_MONKEY_EXCLUDES
          value: 'chaos-monkey haproxy'
        - name: DELAY
          value: '30'
        - name: NAMESPACE
          value: namespacename
