import { VStack, Button, Text } from "native-base"

export default function Login() {
    return (
        <VStack flex={1} bgColor='#59439C'>
            <Text color='white' textAlign='center' fontSize='3xl' mt={10} mb={4}>
                +Rango
            </Text>
            <Button
                w='3xs'
                h={16}
                rounded='2xl'
                mt={10}
                bgColor='white'
                _pressed={{
                    bg: 'gray.400'
                }}
            >
                <Text color='#59439C' fontWeight='bold' fontSize={20}>Login</Text>
            </Button>
        </VStack>
    )
}