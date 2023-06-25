export type SampleResponse = Pick<Sample, "id"|"text">

export type Sample = {
    id: number,
    text: string,
    created_at: string,
    updated_at: string,
}
