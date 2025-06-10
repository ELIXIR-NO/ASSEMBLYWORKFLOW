include {ingress_ASSEMBLYPIPELINE} from '../../modules/ingress'
include {spades_meta} from '../../modules/spades'
include {egress_ASSEMBLYPIPELINE} from '../../modules/egress'

workflow {
	def ingress_ch = channel
		.fromFilePairs(params.ingresspath + '*_{1,2}.dedupe.good.tagged.filter.repaired.fastq.gz')  
		.toSortedList( { a, b -> a[0] <=> b[0] } )
		.flatMap()

	def ASSEMBLYPIPELINE_ch = channel.of(ASSEMBLYPIPELINE(ingress_ch))

	ASSEMBLYPIPELINE_ch | view()
}


workflow ASSEMBLYPIPELINE {
	take:
		ingress_ch
	main:
		ingress_ASSEMBLYPIPELINE(ingress_ch) | spades_meta | egress_ASSEMBLYPIPELINE
	emit:
		egress_ASSEMBLYPIPELINE.out
}

workflow.onComplete {
    println ( workflow.success ? """
	ASSEMBLYPIPELINE execution summary
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