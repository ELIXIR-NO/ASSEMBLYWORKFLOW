include {ASSEMBLYPIPELINE} from './modules/ASSEMBLYPIPELINE'

workflow {
	def ingress_ch = channel
		.fromFilePairs(params.ingresspath + '*_{1,2}.dedupe.good.tagged.filter.repaired.fastq.gz')  
		.toSortedList( { a, b -> a[0] <=> b[0] } )
		.flatMap()
	
	def ASSEMBLYWORKFLOW_ch = channel.of(ASSEMBLYWORKFLOW(ingress_ch))
	
	ASSEMBLYWORKFLOW_ch | view()
}

workflow ASSEMBLYWORKFLOW {
	take:
		ingress_ch
	main:
		ASSEMBLYPIPELINE(ingress_ch)
	emit:
		ASSEMBLYPIPELINE.out
}

workflow.onComplete {
    println ( workflow.success ? """
	ASSEMBLYWORKFLOW execution summary
        ---------------------------
        Completed at: ${workflow.complete}
        Duration    : ${workflow.duration}
        Success     : ${workflow.success}
        workDir     : ${workflow.workDir}
        exit status : ${workflow.exitStatus}
        """ : """
        Failed: ${workflow.errorReport}
        exit status : ${workflow.exitStatus}
        """
    )
}