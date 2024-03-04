from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from starkware.cairo.cairo_verifier.layouts.recursive.cairo_verifier import verify_cairo_proof
from starkware.cairo.stark_verifier.core.stark import StarkProof

func main{
    output_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr, bitwise_ptr: BitwiseBuiltin*
}() -> () {
    alloc_locals;

    let proof_mem: StarkProof* = alloc();
    local proof: StarkProof* = proof_mem;
    %{
        segments.write_arg(ids.proof.address_, [(int(x, 16) if x.startswith('0x') else ids.proof.address_ + int(x)) for x in program_input["proof"]])
    %}

    let (program_hash, output_hash) = verify_cairo_proof(proof);

    assert output_ptr[0] = program_hash;
    assert output_ptr[1] = output_hash;
    let output_ptr = output_ptr + 2;

    return ();
}
