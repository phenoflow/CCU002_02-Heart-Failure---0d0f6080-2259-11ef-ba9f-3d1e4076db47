cwlVersion: v1.0
steps:
  read-potential-cases-disc:
    run: read-potential-cases-disc.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
      potentialCases:
        id: potentialCases
        source: potentialCases
  ccu002_02-heart-failure-hf-letter---primary:
    run: ccu002_02-heart-failure-hf-letter---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-disc/output
  ccu002_02-heart-failure-hf---primary:
    run: ccu002_02-heart-failure-hf---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: ccu002_02-heart-failure-hf-letter---primary/output
  right-ccu002_02-heart-failure-hf---primary:
    run: right-ccu002_02-heart-failure-hf---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: ccu002_02-heart-failure-hf---primary/output
  systolic-ccu002_02-heart-failure-hf---primary:
    run: systolic-ccu002_02-heart-failure-hf---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: right-ccu002_02-heart-failure-hf---primary/output
  congestive-ccu002_02-heart-failure-hf---primary:
    run: congestive-ccu002_02-heart-failure-hf---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: systolic-ccu002_02-heart-failure-hf---primary/output
  ccu002_02-heart-failure-hf-cardiac---primary:
    run: ccu002_02-heart-failure-hf-cardiac---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: congestive-ccu002_02-heart-failure-hf---primary/output
  acute-ccu002_02-heart-failure-hf---primary:
    run: acute-ccu002_02-heart-failure-hf---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: ccu002_02-heart-failure-hf-cardiac---primary/output
  ccu002_02-heart-failure-hf-fraction---primary:
    run: ccu002_02-heart-failure-hf-fraction---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: acute-ccu002_02-heart-failure-hf---primary/output
  chronic-ccu002_02-heart-failure-hf---primary:
    run: chronic-ccu002_02-heart-failure-hf---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: ccu002_02-heart-failure-hf-fraction---primary/output
  ccu002_02-heart-failure-hf-quality---primary:
    run: ccu002_02-heart-failure-hf-quality---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: chronic-ccu002_02-heart-failure-hf---primary/output
  ccu002_02-heart-failure-hf-class---primary:
    run: ccu002_02-heart-failure-hf-class---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: ccu002_02-heart-failure-hf-quality---primary/output
  heart---primary:
    run: heart---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: ccu002_02-heart-failure-hf-class---primary/output
  hypertensive-ccu002_02-heart-failure-hf---primary:
    run: hypertensive-ccu002_02-heart-failure-hf---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: heart---primary/output
  ccu002_02-heart-failure-hf-invitation---primary:
    run: ccu002_02-heart-failure-hf-invitation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: hypertensive-ccu002_02-heart-failure-hf---primary/output
  ventricular-ccu002_02-heart-failure-hf---primary:
    run: ventricular-ccu002_02-heart-failure-hf---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: ccu002_02-heart-failure-hf-invitation---primary/output
  renal-ccu002_02-heart-failure-hf---primary:
    run: renal-ccu002_02-heart-failure-hf---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: ventricular-ccu002_02-heart-failure-hf---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: renal-ccu002_02-heart-failure-hf---primary/output
class: Workflow
inputs:
  potentialCases:
    id: potentialCases
    doc: Input of potential cases for processing
    type: File
  inputModule1:
    id: inputModule1
    doc: Python implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
