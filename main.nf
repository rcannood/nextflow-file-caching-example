#!/usb/bin/env nextflow
nextflow.enable.dsl=2

process foo {
    tag "${name}"
    echo true
    cpus 1
    memory 500.MB
    container "opensuse/leap:latest"
    cache 'lenient'
    input:
        val(name)
        path(template_file, stageAs: "template2.txt")
    output:
        path("${name}.txt")
    """
    sha1sum ${template_file}
    cat ${template_file} > ${name}.txt
    echo ${name} >> ${name}.txt
    """
}

workflow {
    names = Channel.from(['Riri', 'Fifi', 'Loulou'])
    template_file = file("${projectDir}/assets/template.txt")
    foo(names, template_file)
}
