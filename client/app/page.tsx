'use client';

import { apiClient } from '@/utils/axios'

export async function getSample() {
  const res = await apiClient.get<any>('sample');
  console.log(res.data);
}

export async function postSample() {
  const data = {
    text: "フガフガ",
  }
  const res = await apiClient.post('sample', data);
  console.log(res.data);
}

export default function Home() {
  return (
    <div>
      <h1 onClick={() => getSample()}>ゲット</h1>
      <h1 onClick={() => postSample()}>ポスト</h1>
    </div>
  )
}
